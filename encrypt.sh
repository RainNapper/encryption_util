if [ -z "$1" ]
then
  echo "No argument supplied. Provide path to file to be encrypted."
  echo "Example usage: ./encrypt.sh ./path/to_file.txt"
  exit 1
fi

OUT_DIR=out
if [[ -e $OUT_DIR ]] ; then
  i=1
  while [[ -e $OUT_DIR-$i ]] ; do
    let i++
  done
  OUT_DIR=$OUT_DIR-$i
fi
mkdir $OUT_DIR
openssl rand -base64 128 -out ./$OUT_DIR/otp.key
openssl enc -aes-256-cbc -salt -in ./$1 -out ./$OUT_DIR/$1.enc -pass file:./$OUT_DIR/otp.key
echo "openssl enc -d -aes-256-cbc -in ./$1.enc -out ./$1 -pass file:./otp.key" >> ./$OUT_DIR/decrypt.sh
echo $'Usage:\nbash ./decrypt.sh' >> ./$OUT_DIR/README
echo "Successfully encrypted file. Output in ${OUT_DIR}"
