NAME := libft.a

SONAME := libft.so

BUILDDIR := .build/

OBJDIR := $(addprefix $(BUILDDIR), objs/)

DEPDIR := $(addprefix $(BUILDDIR), deps/)

SRCDIR := ./

FILE := ft_isalpha \
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
		   ft_strjoin

SRCFILE := $(addsuffix .c, $(FILE))

OBJFILE := $(addsuffix .o, $(FILE))

DEPFILE := $(addsuffix .d, $(FILE))

SRCS := $(addprefix $(SRCDIR), $(SRCFILE))

OBJS := $(addprefix $(OBJDIR), $(OBJFILE))

DEPS := $(addprefix $(DEPDIR), $(DEPFILE))

CC := cc

CFLAGS := -Wall -Wextra -Werror

CPPFLAGS := -I

INCS := .

DEPSFLAGS := -MMD -MP -MF

SOFLAGS := -fPIC

AR := ar

ARFLAGS := rcs

RM := rm -rf

all: $(NAME)

$(NAME): $(OBJS)
	@echo "\033[0;92m"
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)
	@echo "\033[0m"

so: $(SONAME)

$(SONAME): $(OBJS)
	@echo "\033[0;94m"
	$(CC) -shared -o $(SONAME) $(OBJS)
	@echo "\033[0m"

$(OBJDIR)%.o: $(SRCDIR)%.c | $(OBJDIR) $(DEPDIR)
	@echo -n "\033[0;90m"
	$(CC) $(CFLAGS) $(SOFLAGS) $(CPPFLAGS) $(INCS) $(DEPSFLAGS) $(DEPDIR)$*.d -c $< -o $@
	@echo -n "\033[0m"

$(OBJDIR) $(DEPDIR):
	mkdir -p $@

clean:
	@echo -n "\033[0;91m"
	$(RM) $(BUILDDIR)
	@echo -n "\033[0m"

fclean: clean
	@echo -n "\033[0;91m"
	$(RM) $(NAME) $(SONAME)
	@echo -n "\033[0m"

re: fclean all

reso: fclean so

-include DEPS

.PHONY: all clean fclean re so reso
