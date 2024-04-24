#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY4,�  ��� }���o߮����    P����m����L��OLQ==2CS�CI�F��<���M�=M4 �	����j4j4�� ��   D�F�MMG��F@�CCF� ��� �h����a4h �d�I	��F��Q��A�� њ11 L#��m��]�gN�H��0�CX�+,Ҳ|��%��� %���p;I�`�^7��\�1��0�h�Ai`Bt_�|��3�dAF��2��+��󮅽�C ������*�}�u,�&����,��B�-�/���?f�c��Q�nP���I,f���2c���֥֔,K�b�b]WwZ�J�V�vѵ%��3����Sy���44#KKZb!�*q��C�EL�`�����D�Zz�%� �H?�҂CL��_�X�vGsṈ	���d���a�|{&+�x���f���~09D�2���\}��׊v�#5�CD~����J���bg��،n�$��*�=jZ�u�JUk������/W؈�����`��H+G*�Ho����H������	Oi�kHh�ğ�ۀ|4yI=צ��?��Y��e��V�W���`SD�8�d���˸T��BD"��@t����f��SZ@����'��+���L��ʰtU�g���M8�޳2ڻ8��"c��`�T�����3%QQt��j� Me/6��Ѹl5��O^��y�-S������C������u�E�AX
!�=E1=, ���W<A V��n`3@�
���'؟�20�΃bP��`A�nܽ:�7�����±m��7����,8fl�25��[��n�⯑�́�ðiް�eR�5�mk>�ꇩ�z�	�3h�H:�
�Bw�/�*Y�E���8���i��0 �R��o	Z���* WS"#;̕�)��0�v�P��W�ByY&<ѓ%��� m����&�u�3y��]^��_2�j���J�B����J"v������B�ړѨ�2����\�	��OmDa�Km �]���I��ƻ��]�I.T��C�rE8P�4,�