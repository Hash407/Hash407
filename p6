#include <stdio.h>
#include <stdlib.h>

#define MAX 5

char cq[MAX];
int front = -1, rear = -1;

/* Check Empty */
int isEmpty()
{
    return (front == -1);
}

/* Check Full */
int isFull()
{
    return ((rear + 1) % MAX == front);
}

/* Insert */
void insert(char x)
{
    if (isFull())
    {
        printf("Queue Overflow\n");
        return;
    }
    if (isEmpty())
        front = rear = 0;
    else
        rear = (rear + 1) % MAX;

    cq[rear] = x;
}

/* Delete */
void delete()
{
    if (isEmpty())
    {
        printf("Queue Underflow\n");
        return;
    }
    printf("Deleted element: %c\n", cq[front]);

    if (front == rear)
        front = rear = -1;
    else
        front = (front + 1) % MAX;
}

/* Display */
void display()
{
    int i;
    if (isEmpty())
    {
        printf("Queue is Empty\n");
        return;
    }

    printf("Queue elements: ");
    i = front;
    while (1)
    {
        printf("%c ", cq[i]);
        if (i == rear) break;
        i = (i + 1) % MAX;
    }
    printf("\n");
}

int main()
{
    int ch;
    char x;

    do
    {
        printf("=======CIRCULAR QUEUE======");
        printf("\n1.Insert Elements  \n2.DeleteElements  \n3.Display  \n4.Exit\n");
        scanf("%d", &ch);

        switch (ch)
        {
        case 1:
            printf("Enter element: ");
            scanf(" %c", &x);
            insert(x);
            break;
        case 2:
            delete();
            break;
        case 3:
            display();
            break;
        case 4:
            exit(0);
        default:
            printf("Invalid choice\n");
        }
    } while (1);

    return 0;
}
