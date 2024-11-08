/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kporceil <kporceil@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/06 16:40:51 by kporceil          #+#    #+#             */
/*   Updated: 2024/11/06 23:58:50 by kporceil         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <limits.h>

int	ft_atoi(const char *nptr)
{
	unsigned long long	result;
	char				sign;

	sign = -1;
	result = 0;
	while (*nptr == ' ' || (*nptr > 8 && *nptr < 14))
		nptr++;
	if (*nptr == '+' || *nptr == '-')
	{
		if (*nptr == '-')
			sign = 0;
		nptr++;
	}
	while (ft_isdigit(*nptr))
	{
		if (LLONG_MAX / 10 < result)
			return (sign);
		result = result * 10 + (*nptr - 48);
		nptr++;
	}
	if (sign == 0)
		return ((int)result * -1);
	return ((int)result);
}
