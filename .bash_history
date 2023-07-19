sudo apt update
sudo apt install git cmake gdb build-essential clang clang-tidy clang-format gcc-doc pkg-config glibc-doc tcpdump tshark
ls
telnet cs144.keithw.org http
lssss
git clone https://github.com/cs144/minnow
ls
cd minnow
ls
cd ..
telnet cs144.keithw.org http
ls
telnet cs144.keithw.org http
ls
telnet cs144.keithw.org http
telnet http://cs144.keithw.org/lab0/sunetid http
telnet cs144.keithw.org http
netcat -v -l -p 9090
fg
telnet localhost 9090
cd minnow/
ls
cmake -S . -B build
ls
cmake --build build
cd ..
code minnow
make
cd apps
ls
make
cd ..
ls
cd build
make
./apps/webget cs144.keithw.org /hello
make
./apps/webget cs144.keithw.org /hello
make
./apps/webget cs144.keithw.org /hello
make
./apps/webget cs144.keithw.org /hello
make
./apps/webget cs144.keithw.org /hello
make
./apps/webget cs144.keithw.org /hello
make
./apps/webget cs144.keithw.org /hello
make
./apps/webget cs144.keithw.org /hello
cmake --build build --target check webget
cd ..
cmake --build build --target check webget
make
cd build/
make
cd ..
cmake --build build --target check webget
cmake -S . -B build
cmake --build build --target check_webget
git add webget.cc
cd apps
ls
git add webget.cc
git commit -m "webget"
cd ..
git push --mirror https://github.com/kaikato/minnow
git status
git add writeups/check0.md 
git commit -m "webget"
git config --global user.name "kaikato"
git commit -m "webget"
make
cd build
make
ls
cd 
cd minnow
ls
cd build
make
cd ..
cmake --build build --target check
ls
cmake --build build --target check0
cd build
make
cd ..
cmake --build build --target check0
cd build
make
cd ..
cmake --build build --target check0
make
cd build
make
cd ..
cmake --build build --target check0cd 
cd build
make
cd ..
cmake --build build --target check0
cd build
make
cd ..
cmake --build build --target check0
cd build
make
cd ..
cmake --build build --target check0
cmake --build build --target format
cmake --build build --target tidy
cd build
make
cd ..
cmake --build build --target tidy
cmake --build build --target check0
git config --global user.email "kaiykato@stanford.edu"
git config --global user.name "kaikato"
git status
cd minnow
git status
git fetch
git merge origin/check1-startercode
ls
cmake -S . -B build
cmake --build build
cd minnow
cd build
make
cd ..
cmake --build build --target check1
git pull
cmake --build build --target check1
./scripts/lines-of-code
ls
cd script
cd scripts
./lines-of-code 
cd ..
sudo apt-get install gdb
gdb tests/reassembler_single.cc
cd build
gdb tests/reassembler_single
cd ..
cmake --build build --target check1
cd build
make
cd ..
cmake --build build --target check1
cd build
gdb tests/reassembler_cap
make
gdb tests/reassembler_cap
make
gdb tests/reassembler_cap
make
gdb tests/reassembler_cap
make
gdb tests/reassembler_cap
make
gdb tests/reassembler_cap
make
gdb tests/reassembler_cap
cd tests
ls
./reassembler_cap
cd ..
make
./tests/reassembler_cap
make
./tests/reassembler_cap
make
./tests/reassembler_cap
gdb tests/reassembler_cap
cd ..
cmake --build build --target check1
make
cmake --build build --target check1
gdb build/tests/reassembler_cap
cmake --build build --target check1
q
cmake --build build --target check1
gdb build/tests/reassembler_cap
cmake --build build --target check1
gdb build/tests/reassembler_cap
cmake --build build --target check1
gdb build/tests/reassembler_cap
cmake --build build --target check1
gdb build/tests/reassembler_cap
cmake --build build --target check1
gdb build/tests/reassembler_cap
cmake --build build --target check1
git status
git add src/reassembler.cc
git add src/reassembler.hh
git commit -m "passes seq"
cmake --build build --target check1
gdb build/tests/reassembler_dup
cmake --build build --target check1
git status
git add src/reassembler.cc
git add src/reassembler.hh
git commit -m "passes 13 - holes"
gdb build/tests/reassembler_overlapping
cmake --build build --target check1
cd build
make
cd ..
cmake --build build --target check1
cd build
cd tests
ls
sudo apt install clangd
/home/kaiykato/build/tests/reassembler_win
cd minnow
cd build
./tests/reassembler_win
make
./tests/reassembler_win
make
./tests/reassembler_win
make
./tests/reassembler_win
cd ..
cmake --build build --target check1
git status
git add src*
git status
git commit -m "pass all tests"
python3 ./scripts/lines-of-code
cmake --build build --target check1
/home/kaiykato/build/tests/reassembler_speed_test
cmake --build build --target check1
cd ..
cd minnow
cmake --build build --target check1
/home/kaiykato/build/tests/reassembler_speed_test
git status
git add src/reassembler.cc
git commit -m "passes all, except timeout"
git fetch
git pull origin/check1-startercode
cd ..
git pull origin/check1-startercode
cd minnow
git merge origin/check1-startercode
cd scriots
cd scripts
./lines-of-code
python3 ./lines-of-code
cd ..
python ./scripts/lines-of-code
python3 ./scripts/lines-of-code
sudo apt install sloccount
python3 ./scripts/lines-of-code
cmake --build build --target check1
ls
cd build
ls
cd tests
ls
./reassembler_win
cd ../../
make
cd build
make
cd tests
./reassembler_win
cd ..
cmake --build build --target check1
/home/kaiykato/build/tests/reassembler_win_sanitized
/home/kaiykato/build/tests/reassembler_win
cmake --build build --target check1
cd ..
cmake --build build --target check1
cd 
ls
cd minnow
cmake --build build --target check1
git status
git add src/reassembler.cc
git add src/reassembler.hh
git commit -m "pass all tests but no timeouts"
cmake --build build --target check1
ls
cd minnow
cmake --build build --target check1
cd minnow
git status
git add src/reassembler.cc
git commit -m "passes up to speed test w/ some seed changes"
cmake --build build --target check1
ls
cmake --build build --target check1
cd build
mak
make
cd ../minnow
cmake --build build --target check1
git status
git add src/reassembler.cc
cmake --build build --target check1
git stayus
git status
git add src/reassembler.hh 
git commit -m "removed shadowBuffer"
cmake --build build --target check1
cd build
ls
./tests/reassembler_speed_test 
./tests/reassembler_win 
valgrind
sudo apt  install valgrind  # version 1:3.18.1-1ubuntu2
valgrind tests/reassembler_win
valgrind tests/reassembler_speed_test
valgrind tests/reassembler_single
valgrind tests/reassembler_win
valgrind tests/reassembler_holes
valgrind tests/reassembler_holes -s
valgrind tests/reassembler_seq -s
cd minnow
cmake --build build --target check1
cd minnow
cmake --build build --target check1
n
cmake --build build --target check1
cd build
make
cd ..
cmake --build build --target check1
cd minnow
cmake --build build --target check1
git status
cd minnow
git status
git add src*
git add writeups*
git status
git commit -m "check1 done"
cmake --build build --target check0
cmake --build build --target check1
git status
git add src*
git status
git commit -m "fixed byte_stream to append string"
cd minnow/
cmake --build build --target check2
git status
git add src*
git commit -m "all tests pass check2"
cmake --build build --target check2
cd minnow/
cmake --build build --target check2
git status
git add src*
git status
git commit -m "wrapp done"
cmake --build build --target check2
cd build
make
cd ..
cmake --build build --target check2
/home/kaiykato/build/tests/wrapping_integers_roundtrip
cd minnow
cd build/
make
cd ..
cmake --build build --target check2
cd build
make
cd ..
cmake --build build --target check2
cd build/
make
cd ..
cmake --build build --target check2
cd minnow/
cmake --build build --target check1
git fetch --all
git merge origin/check2-startercode
cmake -S . -B build
cmake --build build
cmake --build build --target check2
cd build/
make
cd ..
cmake --build build --target check2
cd build
make
cd ..
cmake --build build --target check2
cd minnow/
cmake --build build --target check2
cd minnow
cmake --build build --target check2
cd build
make
cd ..
make
cmake --build build --target check2
cd build
make
cd ..
cmake --build build --target check2
cmake --build build --target format
cmake --build build --target tidy
cmake --build build --target check2
git merge origin/check2-startercode
cmake --build build --target check2
git status
git add src*
git commit -m "pass all test and cleaned up"
cmake --build build --target check2
cd minnow/
ls
git status
git add src*
git commit -m "last commit before check 3 start"
git fetch --all
git merge origin/check3-startercode 
cmake -S . -B build
cmake --build build
git log
cd minnow/
make
cd build
make
cd ..
cmake --build build --target check3
/home/kaiykato/build/tests/byte_stream_basics_sanitized
make
/home/kaiykato/build/tests/byte_stream_basics_sanitized
cd ..
make
/home/kaiykato/build/tests/byte_stream_basics_sanitized
cd CMakeFiles/
make
/home/kaiykato/build/tests/byte_stream_basics_sanitized
/usr/bin/g++  -I/home/kaiykato/minnow/util -I/home/kaiykato/minnow/src  -Wall -Wpedantic -Wextra -Weffc++ -Werror -Wshadow -Wpointer-arith -Wcast-qual -Wformat=2 -Wno-unqualified-std-cast-call -g -std=gnu++20 -o CMakeFiles/send_connect.dir/send_connect.cc.o -c /home/kaiykato/minnow/tests/send_connect.cc
/home/kaiykato/build/tests/send_connect
cd ..
cd ../minnow/
cmake --build build --target check3
/home/kaiykato/build/tests/send_connect
cmake --build build --target check3
git status
git add src*
git commit -m "passes pre-timer tests"
cmake --build build --target check3
cd minnow/
cmake --build build --target check3
cd ../build
make
cd tests
make
cd minnow/
cmake --build build --target check3
make
cd build/
make
cd ..
cd build/
make
cd ..
cmake --build build --target check3
gdb /tests/send_retx.cc
cd build
gdb tests/send_rtx
gdb tests/send_retx
cd ..
cmake --build build --target check3
cd build
./tests/send_window
cd ..
cmake --build build --target check3
cd build
gdb tests/send_window
cd ..
cmake --build build --target check3
git status
git add src*
git commit -m "pass through close"
cd minnow/
cmake --build build --target check3
gdb build/tests/send_close
cmake --build build --target check3
gdb build/test/send_extra
gdb build/test/send_extra.cc
gdb build/tests/send_extra
cmake --build build --target check3
gdb build/tests/send_extra
cmake --build build --target check3
cd minnow/
cmake --build build --target check3
gdb build/tests/send_retx
cmake --build build --target check3
cmake --build build --target format
cmake --build build --target tidy
cmake --build build --target check3
git status
git add src*
git status
git add writeups*
git commit -m "all done check3"
cd minnow
git status
git fetch --all
git merge origin/check4-startercode
git add scripts/lines-of-code 
git stash
git merge origin/check4-startercode
cmake -S . -B build
cmake --build build
make
cd build/
make
cmake --build build --target check4
cd ..
cmake --build build --target check4
make
cmake --build build --target check4
make
cmake --build build --target check4
git status
git add src*
git commit -m "up to 5 sec"
cmake --build build --target check4
git add src*
git commit -m "all tests pass"
cd minnow/
ls
cmake --build build --target check4
cd minnow/
ls
cmake --build build --target check4
git status
git add src*
git commit -m "multiple ARP requests in one IP"
git status
git add writeups*
git status
git commit -m "writeup"
git fetch --all
git merge origin/check5-startercode
cmake --build build --target check4
cmake -S . -B build
cmake --build build
cd minnow/
ls
cmake --build build --target check5
cmake --build build --target check4
git add src*
git commit -m "some progress on router"
cd minnow/
cmake --build build --target check4
cmake --build build --target check5
gdb tests/router.xx
gdb tests/router.cc
gdb tests/router
cd build
gdb tests/router
cd ..
cmake --build build --target check5
cd build
gdb test/router
ls
gdb tests/router
cd ..
cmake --build build --target check5
git add src*
git commit -m "pass check5"
git status
cmake --build build --target check5
cd build
./apps/endtoend client cs144.keithw.org 6823
s
</dev/null ./apps/endtoend client cs144.keithw.org 6823 > /tmp/big-received.txt
sha256sum /tmp/big-received.txt
</dev/null ./apps/endtoend client cs144.keithw.org 6823 > /tmp/big-received.txt
sha256sum /tmp/big-received.txt
git status
git add src*
git add writeups*
git commit -m "finished check5"
git status
it fetch --all
git fetch --all
git merge origin/check6-startercode
cmake -S . -B build
cmake --build build
git log
cd build
./apps/endtoend server cs144.keithw.org 6822
dd if=/dev/urandom bs=1M count=1 of=/tmp/big.txt
ls
./apps/endtoend server cs144.keithw.org 6822 < /tmp/big.txt
dd if=/dev/urandom bs=1M count=1 of=/tmp/big.txt
./apps/endtoend server cs144.keithw.org 6822 < /tmp/big.txt
sha256sum /tmp/big.txt
cd minnow/
cmake --build build --target check0 check1 check2 check3 check4 check5
cmake --build build --target speed
git status
git bundle create kaiykato.git --all
cd minnow
cd build
./apps/endtoend server cs144.keithw.org 6822
dd if=/dev/urandom bs=1M count=1 of=/tmp/big.txt
./apps/endtoend server cs144.keithw.org 6822 < /tmp/big.txt 
sha256sum /tmp/big.txt
git status
git add writeups/*
git commit -m "added writeup6"
