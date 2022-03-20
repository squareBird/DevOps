kops create cluster \
--master-zones ap-northeast-2a \
--zones ap-northeast-2a,ap-northeast-2c \
--networking calico \
--state $KOPS_STATE_STORE \
--topology $KOPS_TOPOLOGY \
--master-size $KOPS_MASTER_SIZE \
--master-count $KOPS_MASTER_COUNT \
--node-size $KOPS_NODE_SIZE \
--node-count $KOPS_NODE_COUNT \
--ssh-public-key=~/.ssh/kops.pub \
--cloud aws \
--name $KOPS_CLUSTER_NAME \
--yes

kops create cluster \
--master-zones ap-northeast-2a \
--zones ap-northeast-2a,ap-northeast-2c \
--networking calico \
--state $KOPS_STATE_STORE \
--topology $KOPS_TOPOLOGY \
--master-size $KOPS_MASTER_SIZE \
--master-count $KOPS_MASTER_COUNT \
--node-size $KOPS_NODE_SIZE \
--node-count $KOPS_NODE_COUNT \
--ssh-public-key=~/.ssh/kops.pub \
--cloud aws \
--$NAME \
--yes

--dns-zone $KOPS_DNS_ZONE \
--dns public \

--master-size t3a.small \
--master-count 1 \
--node-size t3a.micro \
--node-count 1 \


# name : cluster 이름
# master-zones : 마스터가 사용할 AZ
# zones : 노드가 사용할 az
# state : 쿠버네티스 상태관리 S3 버킷명
# topology : 클러스터를 public, private 어떻게 오픈할지
#     - public 노드에 public ip 부여하여 ssh 접속 가능
#     - bastion 서버 생성 후 접속 필요
# networking : calico, kopeio-vxlan, weave 등 cni 선택
# master-size : 마스터 노드 인스턴스 타입
# master-count  마스터노드 갯수(홀수)
# node-size : 워커노드 타입
# node-count : 워커노드 갯수
# cloud : cloud 종류
