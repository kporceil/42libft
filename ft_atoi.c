/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kporceil <kporceil@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/06 16:40:51 by kporceil          #+#    #+#             */
/*   Updated: 2024/11/10 23:52:08 by kporceil         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <limits.h>
#include <stdint.h>

int	ft_atoi(const char *nptr)
{
	long	nb;
	size_t	i;
	int8_t	sign;

	i = 0;
	nb = 0;
	sign = 1;
	while (nptr[i] && ((nptr[i] > 8 && nptr[i] < 14) || nptr[i] == 32))
		i++;
	if (nptr[i] == '-')
		sign = -1;
	if (nptr[i] == '-' || nptr[i] == '+')
		i++;
	while (nptr[i] && nptr[i] > 47 && nptr[i] < 58)
	{
		if (sign == -1 && (LONG_MIN / 10 > -nb
				|| 10 * -nb < LONG_MIN + (nptr[i] - 48)))
			return ((int)LONG_MIN);
		if (sign == 1 && (LONG_MAX / 10 < nb
				|| nb * 10 > LONG_MAX - (nptr[i] - 48)))
			return ((int)LONG_MAX);
		nb = nb * 10 + (nptr[i++] - 48);
	}
	return (nb * sign);
}
