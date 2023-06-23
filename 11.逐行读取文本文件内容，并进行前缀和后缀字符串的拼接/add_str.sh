当然！除了使用awk，还有其他方法可以实现将每行数据与预定义字符串进行拼接并输出的功能。你可以使用while循环结合read命令来逐行读取文件，并在循环中进行字符串拼接操作。以下是一个示例：

shell
Copy code
#!/bin/bash

# 指定要读取的文件路径
file_path="path/to/file.txt"

# 检查文件是否存在
if [ ! -f "$file_path" ]; then
    echo "文件不存在: $file_path"
    exit 1
fi

# 定义要拼接的字符串
prefix="前缀字符串: "

# 逐行读取文件并与预定义字符串进行拼接后输出
while IFS= read -r line; do
    echo "$prefix$line"
done < "$file_path"
在这个示例中，我们使用while循环和read命令逐行读取文件。在循环体内，我们使用echo命令将预定义字符串prefix和每行数据line进行字符串拼接，并输出结果。

你可以将上述脚本中的"path/to/file.txt"替换为你实际要读取的文本文件路径，并将prefix="前缀字符串: "替换为你想要的预定义字符串。然后执行脚本，每行数据将与预定义字符串进行拼接后输出。

这种方法在不使用awk的情况下，通过逐行读取文件并进行字符串拼接来实现你的需求。希望这个方法对你有帮助！





User
前缀和后缀都有的情况
ChatGPT
如果你希望在每行数据的前后都添加前缀和后缀字符串，你可以在while循环中进行字符串拼接操作，并使用echo命令输出结果。以下是一个示例：

shell
Copy code
#!/bin/bash

# 指定要读取的文件路径
file_path="path/to/file.txt"

# 检查文件是否存在
if [ ! -f "$file_path" ]; then
    echo "文件不存在: $file_path"
    exit 1
fi

# 定义要添加的前缀和后缀字符串
prefix="前缀字符串: "
suffix=" 后缀字符串"

# 逐行读取文件并在每行数据的前后添加前缀和后缀后输出
while IFS= read -r line; do
    result="$prefix$line$suffix"
    echo "$result"
done < "$file_path"
在这个示例中，我们在while循环中使用$prefix和$suffix变量对每行数据进行前后字符串拼接，并将结果保存在result变量中。然后使用echo命令输出$result。

你可以将上述脚本中的"path/to/file.txt"替换为你实际要读取的文本文件路径，并将prefix="前缀字符串: "和suffix=" 后缀字符串"替换为你想要的前缀和后缀字符串。然后执行脚本，每行数据将在前后添加前缀和后缀后进行输出。

这种方法通过逐行读取文件，并在每行数据的前后进行字符串拼接来实现你的需求。希望这个方法符合你的要求！



echo " "
echo "=====================   param check  ====================="
echo " "

if [ "$1" = "-h" ] && [ "$3" = "-c" ]
then
    while getopts ":h:c:" opt; do
    case $opt in
        h)
            if [ ! -f "$OPTARG" ]; then
                echo "2"
                exit 2
            fi;;
        c)
            if [ ! -f "$OPTARG" ]; then
                echo "3"
                exit 3
            fi;;
    esac
done
else
            echo "1"
            exit 1
fi
echo "=====================   param OK　   ====================="
echo " "

echo "=====================   main exec　　　　　  ====================="
echo " "


prefix="ssh ip sh shell_tool.sh -h "
suffix="  $4"
while IFS= read -r line; do
    result="$prefix$line$suffix"
    # echo $result
    exec `$result`
    if [ $? -eq 0 ];then 
        echo 0
    else
        echo 1
    fi 

done < "$2"





