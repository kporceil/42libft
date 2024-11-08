/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kporceil <kporceil@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/07 23:00:00 by kporceil          #+#    #+#             */
/*   Updated: 2024/11/08 02:26:40 by kporceil         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdlib.h>

static size_t	ft_get_len(long nb)
{
	size_t	len;

	len = 1;
	if (nb < 0)
	{
		len++;
		nb *= -1;
	}
	while (nb / 10)
	{
		len++;
		nb /= 10;
	}
	return (len);
}

static size_t	ft_get_len2(long nb)
{
	size_t	len;

	len = 1;
	if (nb < 0)
	{
		len++;
		nb *= -1;
	}
	size_t prout = 1;
	while (nb > prout)
	{
		prout *= 10;
		len++;
	}
	return (len);
}

char	*ft_itoa(int n)
{
	char	*str;
	size_t	len;
	long	nb;

	nb = (long) n;
	len = ft_get_len2(nb);
	str = malloc(sizeof(char) * (len + 1));
	if (!str)
		return (NULL);
	str[len--] = 0;
	if (nb < 0)
	{
		nb *= -1;
		str[0] = '-';
	}
	while (nb / 10)
	{
		str[len--] = nb % 10 + '0';
		nb /= 10;
	}
	str[len--] = nb % 10 + '0';
	return (str);
}

int main(int argc, char **argv)
{
	for (int i = 0; i < 100; i++)
		printf("%s\n", ft_itoa(atoi(argv[1])));
	return (0);
}
