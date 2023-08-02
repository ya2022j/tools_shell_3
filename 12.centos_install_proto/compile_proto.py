

import os

protofile_path = "proto/person.proto"

os.system("export PATH=$PATH:/usr/local/go/bin;")
os.system('export PATH="$PATH:$(go env GOPATH)/bin"')
os.system("go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2")
os.system("go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28")

cmd = """
protoc - -go_out = . --go_opt = paths = source_relative \
    - -go-grpc_out = . --go-grpc_opt = paths = source_relative \
    {0}


""".format(protofile_path)

os.system(cmd)
