#!/bin/bash

# 输入数据文件路径
input_data_files=(
  "../data/input/accidents_utility_spmf.txt"
  "../data/input/BMS_utility_spmf.txt"
  "../data/input/chainstore_utility_spmf.txt"
  "../data/input/chess_utility_spmf.txt"
  "../data/input/connect_utility_spmf.txt"
  "../data/input/foodmart_utility_spmf.txt"
  "../data/input/mushroom_utility_spmf.txt"
  "../data/input/pumsb_utility_spmf.txt"
  "../data/input/retail_utility_spmf.txt"

  # 添加更多的输入数据文件路径
)

# 参数arg
args=(
  # 添加更多的参数
  0.1
  0.2
  0.3
  0.4
  0.5
)

# 遍历输入数据文件路径
for input_file in "${input_data_files[@]}"; do
  # 提取文件名和扩展名
  file_name=$(basename "$input_file")
  extension="${file_name##*.}"

  # 遍历参数
  for arg in "${args[@]}"; do
    # 构造输出结果文件路径
    output_result_path="../data/output/${file_name%.*}_HUIMiner_${arg}_result.txt"

    # 运行.jar文件并传递参数
    java -jar ../Algorithms/HUIMiner/HUIMiner.jar "$input_file" "$output_result_path" "$arg"

    echo "Finished processing $input_file with arg $arg"
  done
done
