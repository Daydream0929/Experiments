# usr/bin/python3

import matplotlib.pyplot as plt

# 数据集
dataset = 'chainstore' # 'chess' 'BMS' 'accidents' 'connect' 'foodmart' 'mushroom' 'pumsb' 'retail'

# runtime or Memory usage
res = 'time (s)' # or 'Memory usage(MB)'

# 假设有5种算法的数据
algorithms = ['HUIMiner', 'FHM', 'mHUIMiner', 'ULBMiner', 'MyAlg']

# 每种算法的输入参数threshold和运行结果time数据
thresholds = {
    'HUIMiner': [1, 2, 3, 4, 5],
    'FHM': [1, 2, 3, 4, 5],
    'mHUIMiner': [1, 2, 3, 4, 5],
    'ULBMiner': [1, 2, 3, 4, 5],
    'MyAlg': [1, 2, 3, 4, 5]
}

times = {
    'HUIMiner': [10, 12, 8, 15, 14],
    'FHM': [8, 9, 10, 11, 12],
    'mHUIMiner': [15, 14, 13, 12, 11],
    'ULBMiner': [7, 6, 5, 4, 3],
    'MyAlg': [13, 14, 15, 16, 17]
}

# 设置样式
plt.style.use('ggplot')

# 绘制曲线图
plt.figure(figsize=(10, 6))

for algorithm in algorithms:
    plt.plot(thresholds[algorithm], times[algorithm], label=algorithm)

plt.xlabel('threshold')
plt.ylabel(f'{res}')
plt.title(f'{dataset}')
plt.legend()
plt.grid(True)

# 使用Latex渲染文本
plt.rcParams['text.usetex'] = True

# 显示图形
plt.savefig(f'../data/output/{dataset}/{res}.png', dpi=300, bbox_inches='tight')
