NAME	= libasm.so

NSM     =   nasm -f elf64

RM	= rm -f

SRCS	= ./strlen.S \
        ./strchr.S \
        ./memset.S \
        ./memcpy.S \
        ./strcmp.S \
        ./memmove.S \
        ./strncmp.S \

OBJS	= $(SRCS:.S=.o)

all: $(NAME)

$(NAME):
	 $(NSM) ./strlen.S
	 $(NSM) ./strchr.S
	 $(NSM) ./memset.S
	 $(NSM) ./memcpy.S
	 $(NSM) ./strcmp.S
	 $(NSM) ./memmove.S
	 $(NSM) ./strncmp.S
	 gcc -g3 -o $(NAME) main.c $(OBJS)
#	 gcc -shared $(OBJS) -o $(NAME)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
