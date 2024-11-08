/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kporceil <kporceil@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/05 00:06:34 by kporceil          #+#    #+#             */
/*   Updated: 2024/11/05 01:22:02 by kporceil         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memchr(const void *s, int c, size_t n)
{
	size_t		i;
	const char	*cs;

	i = -1;
	cs = (const char *)s;
	while (++i < n)
		if (cs[i] == c)
			return ((void *)&(cs[i]));
	return (NULL);
}
