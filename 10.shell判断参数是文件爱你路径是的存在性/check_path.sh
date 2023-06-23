比如 sh t.sh  -h ./a.txt   -c ./c.txt 
想要检测 ./a.txt 和 ./c.txt 是否存在，如何实现
ChatGPT
要检测./a.txt和./c.txt是否存在，你可以在脚本中使用-f选项来判断这两个文件是否是存在的文件。以下是一个示例脚本：

shell
Copy code
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "没有传递参数"
    exit 1
fi

while getopts ":h:c:" opt; do
    case $opt in
        h)
            if [ -f "$OPTARG" ]; then
                echo "文件 $OPTARG 存在"
            else
                echo "文件 $OPTARG 不存在"
            fi
            ;;
        c)
            if [ -f "$OPTARG" ]; then
                echo "文件 $OPTARG 存在"
            else
                echo "文件 $OPTARG 不存在"
            fi
            ;;
        \?)
            echo "无效的选项: -$OPTARG"
            ;;
    esac
done
在这个示例中，我们使用getopts来解析命令行选项-h和-c。如果选项存在，则将选项参数保存在OPTARG变量中。然后，我们使用-f选项检查$OPTARG是否是一个存在的文件。如果是文件，就输出相应的消息，否则输出文件不存在的消息。

你可以运行以下命令来测试这个脚本：

shell
Copy code
$ bash t.sh -h ./a.txt -c ./c.txt
输出将会是：

bash
Copy code
文件 ./a.txt 存在
文件 ./c.txt 存在
注意，这个示例只处理了-h和-c两个选项，你可以根据需要添加其他选项和处理逻辑。
