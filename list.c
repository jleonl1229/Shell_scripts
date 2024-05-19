#include <stdio.h>
#include <stdlib.h>

typedef struct	list
{
	int		num;
	struct list	*next;
}		list;

void printnums(list *stack_a)
{
	if (stack_a)
	{
		while (stack_a)
		{
			printf("Num: %d\n", stack_a->num);
			stack_a = stack_a->next;
		}
	}	
}

void chargueit(int *nums, int *size)
{
	int i = 0;
	list *stack_a = NULL;
	list *head = NULL;
	list *new; 
	while (i < *size)
	{
		new = malloc(sizeof(list) * 1);
		new->num = nums[i];
		new->next = NULL;
		if (stack_a == NULL)
		{
			head = new;
			stack_a = new;
		}
		else
			stack_a->next = new;
		stack_a = stack_a->next;
		free(new);
	}
	printnums(head);
	free(stack_a);
	free(head);
}

int main(void)
{
	int nums[] = {2, 3, 1, 44};
	int i = 0;
	while (nums[i])
		i++;
	chargueit(nums, &i);
	return (0);
}
