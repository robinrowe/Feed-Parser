RM = rm -f
CSTD = -std=c++14
CFLAGS = -lpthread
ROOT_DIR:=$(shell dirname $(realpath $(MAKEFILE_LIST)))
CURL_FLAGS = -lcurl
INCLUDE += -I./include/
OPTIONS  = -std=c++11 -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -Wl,--strip-all
WARNINGS = -Wall -Wextra -Werror

INCLUDE_H = -I $(ROOT_DIR)/include/
INCLUDE_CC = -I $(ROOT_DIR)/src/
MAIN = $(ROOT_DIR)/test.cpp


all:
	g++ $(INCLUDE_H) $(INCLUDE_CC) $(MAIN) -o FeedReader -g $(CSTD) $(CURL_FLAGS) $(CFLAGS)

run:
	./FeedReader

clean:
	$(RM) FeedReader
	$(RM) -r res
	python fetch.py
