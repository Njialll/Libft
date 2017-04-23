/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isset.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mbeilles <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/04/14 15:27:56 by mbeilles          #+#    #+#             */
/*   Updated: 2017/04/14 15:29:16 by mbeilles         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int		ft_isset(int c, char *set)
{
	while (*set)
	{
		if ((unsigned char)c == *set)
			return (1);
		set++;
	}
	return (0);
}
