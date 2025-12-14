# 1. 载入必要的库 (Load necessary libraries)
# 如果提示找不到库，请先运行 install.packages("ggplot2") 和 install.packages("tidyr")
library(ggplot2)
library(tidyr)
library(dplyr) # 载入 dplyr，用于使用管道符号 %>% 和 select

# 2. 创建原始数据框并进行计算 (Create and calculate data frame)
df <- data.frame(
  Q = 1:10,
  AC = c(7, 5, 4, 3.3, 3, 3.1, 3.5, 4.2, 5, 6),
  AR = c(10, 9.5, 9, 8.5, 8, 7.5, 7, 6.5, 6, 5.5)
)

# 计算总值和边际值
df$TC <- df$AC * df$Q
df$TR <- df$AR * df$Q

# 计算边际值 (MC, MR)
# diff() 计算增量，c(NA, ...) 确保数据框行数一致
df$MC <- c(NA, diff(df$TC))
df$MR <- c(NA, diff(df$TR))

# 3. 转换数据格式 (Tidy data: pivot_longer)
# 将 AC, AR, MC, MR 这四列堆叠成两列 (Curve_Type 和 Value)，这是 ggplot 的最佳输入格式
plot_data <- df %>%
  select(Q, AC, AR, MC, MR) %>% 
  pivot_longer(cols = c("AC", "AR", "MC", "MR"), 
               names_to = "Curve_Type", 
               values_to = "Value")

# 4. 绘图 (Generate the plot using ggplot2)
ggplot(plot_data, aes(x = Q, y = Value, color = Curve_Type, group = Curve_Type)) +
  
  # 绘制线条和点
  geom_line(size = 1.2) + 
  geom_point(size = 3) +
  
  # 设置颜色，让不同曲线区分更明显
  scale_color_manual(values = c(
    "AC" = "#d95f02",  # 橙红色 (平均成本)
    "MC" = "#e7298a",  # 紫红色 (边际成本)
    "AR" = "#1b9e77",  # 绿色 (平均收益/价格)
    "MR" = "#7570b3"   # 蓝紫色 (边际收益)
  ),
  labels = c("AC: 平均成本", "AR: 平均收益", "MC: 边际成本", "MR: 边际收益")) +
  
  # 标注利润最大化产量 Q=6 (MR=MC 的最优解)
  geom_vline(xintercept = 6, linetype = "dashed", color = "gray30") +
  annotate("text", x = 6.2, y = 14, label = "利润最大化 Q=6", hjust = 0, color = "black", size = 4) +
  
  # 设置坐标轴刻度，让图表更清晰
  scale_x_continuous(breaks = 1:10) +
  scale_y_continuous(breaks = seq(0, 16, 2)) +
  
  # 添加标题和标签
  labs(
    title = "厂商成本与收益曲线分析",
    subtitle = "最优产量点在 MR=MC 处 (Q=6)",
    x = "产量 (Q)",
    y = "价格 / 成本",
    color = "曲线图例"
  ) +
  
  # 使用简洁的主题样式
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    legend.position = "bottom"
  )