#!/bin/bash

# 输入数据文件路径
input_data_files=(
  "../../data/input/BMS.txt"
)

# 参数arg
args=(
  1
  0.99
  0.98
  0.97
  0.96
  0.95
  0.94
  0.93
  0.92
  0.91
  0.9
  0.89
  0.88
  0.87
  0.86
  0.85
  0.84
  0.83
  0.82
  0.81
  0.8
  0.79
  0.78
  0.77
  0.76
  0.75
  0.74
  0.73
  0.72
  0.71
  0.7
  0.69
  0.68
  0.67
  0.66
  0.65
  0.64
  0.63
  0.62
  0.61
  0.6
  0.59
  0.58
  0.57
  0.56
  0.55
  0.54
  0.53
  0.52
  0.51
  0.5
  0.49
  0.48
  0.47
  0.46
  0.45
  0.44
  0.43
  0.42
  0.41
  0.4
  0.39
  0.38
  0.37
  0.36
  0.35
  0.34
  0.33
  0.32
  0.31
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
  0.19
  0.18
  0.17
  0.16
  0.15
  0.14
  0.13
  0.12
  0.11
  0.1
  0.09
  0.08
  0.07
  0.06
  0.05
  0.04
  0.03
  0.02
  0.01
  # 添加更多的参数
)

total_utility=108457438

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
    java -jar ../../Algorithms/MyAlg/MyAlg.jar "$input_file" "$output_result_path" "$p_size" "$threshold"
  
    echo "Finished processing $input_file with arg $arg and p_size $p_size"

  done
done
