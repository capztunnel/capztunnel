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
BZh91AY&SY_ս�  �_�EP���/n߮����    PN�{]��z�{�H!=L�i4�4&M�2b �	��G���&F&
j�?%<)�OI��h~�=G�� h  @$�������lS�mFA�z�P�M4=@ED��Hz� h=@L� �   Q
��ѩ�G���2@z��C@  ` ���h�6(�	0�
ސʎ��W�14t�o���^�)�XeB0�=���y� �"<�H
0�|h�4�1��a�}I��W�G1!ʞ��Y�_�!�Z��rT�b�bK/�0���V�ⶑ1�2��L��x�K��(�E	K�pd�s�<	�I�k��8��QtR|HY��$�2���L�1�cL�e涪��듕���(!z&h'/d�
S"e~�ۃ ZKM�)T�֑�v�T*�����JcH�Y��'3�R:b�PִM��r4�n�ǎ�k�x9��LHa'��؅VRp�w�����	��}�Yݮc-��c�� �q�rđ�����W�?:T�E�k��̈���K0�m�ýeq6.��֝w$��0��pp9�[;8�HL#]�$��Q���T�R���2��aE��"j�:��;��⪥����]���j�ņ<�,k�� d\��3T�0�f � �Q^{�n��y(�PcBD���I��u��Bx�
T���,X�X��.Pe3m����Z��,O�r1�7�;,�,�02.JsZ˄7����������W5�ĩ0��$�*�Td��I��B�l1�ɨ"��2H����kp�{a�Y�n��j��^��[Á5�gqA��Q"�mS,[�_;��d��&Cl*����]���*��#�YIA�M�^��ѵ(
��,�1kl�h0u��	�ZW�����%+ F�i�>����LQOJ�ʬf��|�?EW�UyW�.�p� ��{�