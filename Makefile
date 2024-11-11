override NAME := libft.a

override BUILDDIR := .build/

override OBJDIR := $(addprefix $(BUILDDIR), objs/)

override DEPDIR := $(addprefix $(BUILDDIR), deps/)

override SRCDIR := ./

BASENAME := ft_isalpha \
		   ft_isascii \
		   ft_isdigit \
		   ft_isprint \
		   ft_toupper \
		   ft_tolower \
		   ft_isalnum \
		   ft_bzero \
		   ft_memset \
		   ft_memcpy \
		   ft_memmove \
		   ft_memcmp \
		   ft_memchr \
		   ft_strlen \
		   ft_strchr \
		   ft_strrchr \
		   ft_strncmp \
		   ft_strnstr \
		   ft_strlcpy \
		   ft_strlcat \
		   ft_calloc \
		   ft_strdup \
		   ft_atoi \
		   ft_substr \
		   ft_putchar_fd \
		   ft_putstr_fd \
		   ft_putendl_fd \
		   ft_putnbr_fd \
		   ft_strmapi \
		   ft_striteri \
		   ft_itoa \
		   ft_strjoin \
		   ft_strtrim \
		   ft_split

BONUS_BASENAME := ft_lstnew_bonus \
				  ft_lstadd_front_bonus \
				  ft_lstsize_bonus \
				  ft_lstlast_bonus \
				  ft_lstadd_back_bonus \
				  ft_lstdelone_bonus \
				  ft_lstclear_bonus \
				  ft_lstiter_bonus \
				  ft_lstmap_bonus

override SRCFILE := $(addsuffix .c, $(BASENAME))

override OBJFILE := $(addsuffix .o, $(BASENAME))

override DEPFILE := $(addsuffix .d, $(BASENAME))

override SRCS := $(addprefix $(SRCDIR), $(SRCFILE))

override OBJS := $(addprefix $(OBJDIR), $(OBJFILE))

override DEPS := $(addprefix $(DEPDIR), $(DEPFILE))

CC := cc

CFLAGS := -Wall -Wextra -Werror

override CPPFLAGS := -I

override INCS := ./

override DEPSFLAGS := -MMD -MP -MF

override AR := ar

override ARFLAGS := rcs

override RM := rm -rf

override MAKEFLAGS += --no-print-directory

EMOJI := ✅

all:
	@$(MAKE) $(NAME)

$(NAME): $(OBJS)
	@echo "\033[0;94m"
	@echo -n "$(EMOJI)"
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)
	@echo "\033[0m"

bonus:
	@$(MAKE) $(NAME) BASENAME="$(BASENAME) $(BONUS_BASENAME)" EMOJI="✨"

$(OBJDIR)%.o: $(SRCDIR)%.c | $(OBJDIR) $(DEPDIR)
	@echo -n "\033[0;90m"
	@echo -n "🔨"
	$(CC) $(CFLAGS) $(CPPFLAGS) $(INCS) $(DEPSFLAGS) $(DEPDIR)$*.d -c $< -o $@
	@echo -n "\033[0m"

$(OBJDIR) $(DEPDIR):
	mkdir -p $@

clean:
	@echo -n "\033[0;91m"
	@echo -n "🗑️"
	$(RM) $(BUILDDIR)
	@echo -n "\033[0m"

fclean: clean
	@echo -n "\033[0;91m"
	@echo -n "🗑️"
	$(RM) $(NAME) $(SONAME)
	@echo -n "\033[0m"

re: fclean all

rebonus: fclean bonus

-include $(DEPS)

.PHONY: all clean fclean re bonus
