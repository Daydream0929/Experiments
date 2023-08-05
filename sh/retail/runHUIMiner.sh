#!/bin/bash

# 输入数据文件路径
input_data_files=(
  "../../data/input/retail.txt"
)

# 参数arg
args=(
  0.0010
  0.0009 
  0.0008
  0.0007
  0.0006
  0.0005
  0.0004
  0.0004
  0.0003
  0.0002
  0.0001
  # 添加更多的参数
)

total_utility=14910915


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
    output_result_path="../../data/output/${file_name%.*}/HUIMiner_${arg}_result.txt"

    # 运行.jar文件并传递参数
    java -jar ../../Algorithms/HUIMiner/HUIMiner.jar "$input_file" "$output_result_path" "$threshold"
  
    echo "Finished processing $input_file with arg $arg"

  done
done
