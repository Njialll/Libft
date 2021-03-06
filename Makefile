# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mbeilles <mbeilles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/11 20:39:18 by mbeilles          #+#    #+#              #
#    Updated: 2017/04/23 14:42:10 by mbeilles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
CC = clang
CFLAGS = -Wall -Werror -Wextra
IFLAGS = -I$(INCLUDES)
INCLUDES = includes
SRC = src
OBJECT = obj
EXEC = all

SRCS = ft_isascii.c       \
	  ft_memcmp.c         \
	  ft_strchr.c         \
	  ft_strequ.c         \
	  ft_strmap.c         \
	  ft_strnew.c         \
	  ft_strtrim.c        \
	  ft_isdigit.c        \
	  ft_memcpy.c         \
	  ft_strclr.c         \
	  ft_striter.c        \
	  ft_strmapi.c        \
	  ft_strnstr.c        \
	  ft_tolower.c        \
	  ft_atoi.c           \
	  ft_isprint.c        \
	  ft_memdel.c         \
	  ft_strcmp.c         \
	  ft_striteri.c       \
	  ft_strncat.c        \
	  ft_strrchr.c        \
	  ft_toupper.c        \
	  ft_bzero.c          \
	  ft_memalloc.c       \
	  ft_memmove.c        \
	  ft_strcpy.c         \
	  ft_strjoin.c        \
	  ft_strncmp.c        \
	  ft_strsplit.c       \
	  ft_isalnum.c        \
	  ft_isspace.c        \
	  ft_isset.c          \
	  ft_memccpy.c        \
	  ft_memset.c         \
	  ft_strdel.c         \
	  ft_strlcat.c        \
	  ft_strncpy.c        \
	  ft_strstr.c         \
	  ft_isalpha.c        \
	  ft_memchr.c         \
	  ft_strcat.c         \
	  ft_strdup.c         \
	  ft_strlen.c         \
	  ft_strnequ.c        \
	  ft_strsub.c         \
	  ft_putchar.c        \
	  ft_putstr.c         \
	  ft_putchar_fd.c     \
	  ft_putendl.c        \
	  ft_putendl_fd.c     \
	  ft_putnbr.c         \
	  ft_putstr_fd.c      \
	  ft_putnbr_fd.c      \
	  ft_itoa.c           \
	  ft_get_pow.c        \
	  ft_lstnew.c         \
	  ft_memdup.c         \
	  ft_lstdelone.c      \
	  ft_lstadd.c         \
	  ft_lstiter.c        \
	  ft_lstdel.c         \
	  ft_lstmap.c         \
	  ft_lstinvert_iter.c
SRCS_O = $(SRCS:.c=.o)
AR_SRC_O = $(SRCS_O:%.o=$(OBJECT)/%.o)




all: header $(SRCS_O)
	@printf "\n \033[90m====> \033[36mGenrating lib... "
	@ar rc $(NAME) $(AR_SRC_O) 2> errors.txt
	@ranlib $(NAME) 2> errors.txt
	@if [ -s errors.txt ] ; \
	then \
		printf "\033[90m[\033[31mKO\033[90m]\n\n" ; \
		cat errors.txt ; \
	else \
		printf "\r\033[34m[\033[36mOK\033[34m] \033[0m\n" ; \
		printf "\033[34m[\033[33mSUCCESS\033[34m] \033[32mLib generated!\n"; \
	fi ;

$(NAME): all

header:
	@if [ -s errors.txt ] ; \
	then \
		touch errors.txt ; \
	else \
		cp /dev/null errors.txt ; \
	fi ;
	@printf "\033[90m\n"
	@cat header.txt
	@printf "\n\n"

%.o: $(SRC)/%.c
	@$(CC) -o $(OBJECT)/$@ -c $< $(CFLAGS) $(IFLAGS) > errors.txt
	@if [ -s errors.txt ] ; \
	then \
		printf "\r\033[34m[\033[36mOK\033[34m] \033[36m$@\n" ; \
	else \
		printf "\r\033[34m[\033[36mOK\033[34m] \033[90m* \033[32m$@ \033[0m" ; \
	fi ;

clean:
	@rm -f $(AR_SRC_O)

fclean: clean
	@rm -f $(NAME)
	@rm -f errors.txt

re: fclean all

help:
	@echo "\033[1m\033[96mCommands :\033[21m\033[0m"
	@echo "    - \033[1m\033[34mall / libft.a :\033[0m\033[39m compiles \
	libft"
	@echo "    - \033[1m\033[34mclean         :\033[0m\033[39m removes object\
	files"
	@echo "    - \033[1m\033[34mfclean        :\033[0m\033[39m removes object \
	files and libft.a"
	@echo "    - \033[1m\033[34mre            :\033[0m\033[39m redo the compilation\
	of libft.a"
	@echo "    - \033[1m\033[34mhelp          :\033[0m\033[39m you guessed \
	it..."
