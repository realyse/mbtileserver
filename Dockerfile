FROM golang

WORKDIR /

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN GOOS=linux GO111MODULE=on go build -o /mbtileserver

RUN echo "nobody:x:65534:65534:Nobody:/:" > /etc_passwd

#FROM scratch

#COPY --from=0 /mbtileserver /mbtileserver

#COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

#COPY --from=0 /etc_passwd /etc/passwd

USER nobody