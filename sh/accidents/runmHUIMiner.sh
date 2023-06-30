#!/bin/bash

# 输入数据文件路径
input_data_files=(
  "../../data/input/accidents.txt"
)

# 参数arg
args=(
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12
  13
  14
  15
  16
  17
  18
  19
  20
  21
  22
  23
  24
  25
  26
  27
  28
  29
  30
  31
  32
  33
  34
  35
  36
  37
  38
  39
  40
  41
  42
  43
  44
  45
  46
  47
  48
  49
  50
  51
  52
  53
  54
  55
  56
  57
  58
  59
  60
  61
  62
  63
  64
  65
  66
  67
  68
  69
  70
  71
  72
  73
  74
  75
  76
  77
  78
  79
  80
  81
  82
  83
  84
  85
  86
  87
  88
  89
  90
  91
  92
  93
  94
  95
  96
  97
  98
  99
  100
  # 添加更多的参数
)


# 遍历输入数据文件路径
for input_file in "${input_data_files[@]}"; do
  # 提取文件名和扩展名
  file_name=$(basename "$input_file")
  extension="${file_name##*.}"

  # 遍历参数
  for arg in "${args[@]}"; do
    # threshold
    threshold=`expr 196141636 / $arg`

    # 构造输出结果文件路径
    output_result_path="../../data/output/${file_name%.*}/mHUIMiner_${arg}%_result.txt"

    # 运行.jar文件并传递参数
    java -jar ../../Algorithms/mHUIMiner/mHUIMiner.jar "$input_file" "$output_result_path" "$threshold"
  
    echo "Finished processing $input_file with arg $arg"

  done
done
