IMG_ID=$(docker build -t  rootimage .)
CONTAINER_ID=$(docker run -td  rootimage /bin/bash)

echo "Image Id : $IMG_ID \n Container_Id : $CONTAINER_ID\n"
MOUNTDIR=mnt
FS=rootfs.ext4

mkdir $MOUNTDIR
qemu-img create -f raw $FS 2048M
mkfs.ext4 $FS
mount $FS $MOUNTDIR
docker cp $CONTAINER_ID:/ $MOUNTDIR
umount $MOUNTDIR