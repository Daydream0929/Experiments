#!/bin/bash

# 输入数据文件路径
input_data_files=(
  "../../data/input/chess.txt"
)

# 参数arg
args=(
  0.3
  0.29
  0.28
  0.27
  0.26
  0.25
  0.24
  0.23
  0.22
  0.21
  0.2
  # 添加更多的参数
)

total_utility=2156659


# 遍历输入数据文件路径
for input_file in "${input_data_files[@]}"; do
  # 提取文件名和扩展名
  file_name=$(basename "$input_file")
  extension="${file_name##*.}"

  # 遍历参数
  for arg in "${args[@]}"; do
    # threshold
    threshold=$(echo "$total_utility * $arg"|bc)
    threshold=${threshold%.*}

    # 构造输出结果文件路径
    output_result_path="../../data/output/${file_name%.*}/mHUIMiner_${arg}_result.txt"

    # 运行.jar文件并传递参数
    java -jar ../../Algorithms/mHUIMiner/mHUIMiner.jar "$input_file" "$output_result_path" "$threshold"
  
    echo "Finished processing $input_file with arg $arg"

  done
done
