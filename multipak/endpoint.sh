pdname=${PWD##*/}
imgname=${pdname}":latest"
containername=${pdname}"-container"
docker rm -f $containername
#docker rmi $imgname
docker build -t $imgname .
docker run --rm --name $containername -itd -p 50004:50001 $imgname
docker logs -f $containername
