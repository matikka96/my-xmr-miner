## XMRIG Docs: https://xmrig.com/docs/miner/build/alpine

FROM alpine
WORKDIR /miner
RUN apk add git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev
RUN git clone https://github.com/xmrig/xmrig
RUN mkdir xmrig/build
WORKDIR /miner/xmrig/build
RUN cmake ..
RUN make -j$(nproc)
CMD ./xmrig -o pool.supportxmr.com:443 -u ${XMR_ADDRESS} -k --tls -p ${WORKER_NAME}
