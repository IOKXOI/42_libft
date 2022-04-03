# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oklm <oklm@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/25 05:59:28 by sydauria          #+#    #+#              #
#    Updated: 2021/12/15 22:35:59 by oklm             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CHAR = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isprint.c ft_isascii.c \
	ft_tolower.c ft_toupper.c

STR = ft_strlen.c ft_strjoin.c ft_split.c ft_strtrim.c ft_substr.c ft_strnstr.c \
		ft_strchr.c ft_strrchr.c ft_strncmp.c ft_strlcpy.c ft_strlcat.c \
		ft_strdup.c ft_strmapi.c ft_striteri.c ft_atoi.c ft_itoa.c 

MEM = ft_bzero.c ft_calloc.c ft_memset.c ft_memcpy.c ft_memmove.c ft_memchr.c \
		ft_memcmp.c 

FD = ft_putstr_fd.c ft_putchar_fd.c ft_putnbr_fd.c ft_putendl_fd.c

BONUS = ft_lstnew.c ft_lstsize.c ft_lstlast.c ft_lstadd_front.c \
		ft_lstadd_back.c ft_lstiter.c ft_lstmap.c ft_lstdelone.c ft_lstclear.c

NAME=libft.a
CC = gcc
CFLAGS = -Wall -Wextra -Werror


SRC = $(CHAR) $(STR) $(MEM) $(FD)
OBJ= $(SRC:.c=.o)
BONUS_OBJS	= ${BONUS:.c=.o}

all: $(NAME)
	
$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

bonus: ${OBJ} ${BONUS_OBJS}
	ar rcs ${NAME} ${OBJ} ${BONUS_OBJS}

.c.o:
	gcc $(CFLAGS) -I . -c $< -o $(<:.c=.o)

clean:
	rm -rf *.o

fclean: clean
	rm -rf $(NAME)

re: fclean all

so:
	$(CC) -nostartfiles -fPIC $(CFLAGS) $(SRC)
	gcc -nostartfiles -shared -o libft.so $(OBJ) ${BONUS_OBJS}