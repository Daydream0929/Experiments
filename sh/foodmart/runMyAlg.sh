#!/bin/bash

# 输入数据文件路径
input_data_files=(
  "../../data/input/foodmart.txt"
)

# 参数arg
args=(
  0.000010
  0.000011
  0.000012
  0.000013
  0.000014
  0.000015
  0.000016
  0.000017
  0.000018
  # 添加更多的参数
)

total_utility=12011023

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
    p_size=63
    # 构造输出结果文件路径
    output_result_path="../../data/output/${file_name%.*}/MyAlg_${arg}_result.txt"

    # 运行.jar文件并传递参数
    java -jar ../../Algorithms/MyAlg/MyAlg_3.jar "$input_file" "$output_result_path" "$p_size" "$threshold"
  
    echo "Finished processing $input_file with arg $arg and p_size $p_size"
    sleep 3
  done
done
