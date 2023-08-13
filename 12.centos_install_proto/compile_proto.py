



# 介绍python获取命令行参数的方法：getopt模和argparse模块。
import os
import sys
import getopt



def main(argv):
    """

    python3 compile_proto.py -p  XXXX.proto
    :param argv:
    :return:
    """
    protofile =""

    try:
        options, args = getopt.getopt(argv, "hp:", ['help',"protofile="])

        for option, value in options:
            if option in ("-p", "--protofile"):
                protofile  = value


# protoc -I=$SRC_DIR --go_out=$DST_DIR $SRC_DIR/addressbook.proto
        absolutePath = os.getcwd()
        protofilePath = os.path.join(absolutePath,protofile)
        os.system("export PATH=$PATH:/usr/local/go/bin;")
        # --go_out: protoc-gen-go: Plugin failed with status code 1.の解決方法
        os.system("export GOPATH=$HOME/go")
        os.system("PATH=$PATH:$GOPATH/bin")
        # os.system('export PATH="$PATH:$(go env GOPATH)/bin')
        os.system("go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2")
        os.system("go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28")
        #compile_cmd  = " protoc -I={1} --go_out={1} {0}".format(protofilePath,absolutePath)
        compile_cmd  = " protoc  --go_out=. {0}".format(protofile)
        os.system(compile_cmd)
        print(compile_cmd)




    except getopt.GetoptError:
        print("###################################################")
        print("\n")
        print("\n")
        print("\n")
        print("python3 compile_proto.py -p  XXXX.proto")
        print("\n")
        print("\n")
        print("\n")
        print("###################################################")
        sys.exit()




if __name__ == '__main__':
    main(sys.argv[1:])
