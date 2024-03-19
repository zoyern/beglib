# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/19 20:03:30 by marvin            #+#    #+#              #
#    Updated: 2024/03/19 20:03:30 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= beglib

$(MINI_BUILD_DIR)/%.o: $(MINI_DIR)/%.c
	@mkdir -p $(dir $@)
	@$(CC)	$(CFLAG) -c	$< -o $@
	@clear

all : $(NAME)

$(NAME): $(MINI_OBJ) 
	@echo $(MINI_OBJ)
	${AR} ${NAME}.a ${MINI_OBJ}
			${LIB} ${NAME}.a
	@$(CC) $(MINI_OBJ) -o $(NAME) $(CFLAG)
	@clear

clear :
	@clear
	@echo "42Paris : $(NAME)"
	@echo ""

val :
	@clear
	valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-origins=yes ./$(NAME)
	@echo ""

clean : clear
	@rm -rf build/
	@echo "Clean   : *.o in build !"

fclean : clean
	@rm -f $(NAME)
	@echo "Clean   : ./$(NAME)"

aclean : fclean cleanlib clear

minlibx :
	@git clone https://github.com/42Paris/minilibx-linux.git
	@make -C ./minilibx-linux
	clear
	
cleanlib :
	@rm -rf minilibx-linux

re: fclean all clear 

.PHONY: all clean fclean re