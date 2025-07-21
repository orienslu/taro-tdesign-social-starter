#!/bin/bash

# 设置源目录和目标目录
SOURCE_DIR="./node_modules/tdesign-miniprogram/miniprogram_dist"
TARGET_DIR="./src/tdesign"

# 检查源目录是否存在
if [ ! -d "$SOURCE_DIR" ]; then
    echo "错误: 源目录 $SOURCE_DIR 不存在"
    echo "请确保已安装 tdesign-miniprogram 依赖"
    exit 1
fi

# 如果目标目录已存在，先删除
if [ -d "$TARGET_DIR" ]; then
    echo "目标目录已存在，正在删除..."
    rm -rf "$TARGET_DIR"
fi

# 复制目录
echo "正在复制 tdesign-miniprogram 组件库..."
cp -r "$SOURCE_DIR" "$TARGET_DIR"

# 检查复制是否成功
if [ $? -eq 0 ]; then
    echo "✅ 复制成功！tdesign-miniprogram 组件库已复制到 $TARGET_DIR"
    echo "📁 复制的文件数量: $(find "$TARGET_DIR" -type f | wc -l)"
else
    echo "❌ 复制失败"
    exit 1
fi