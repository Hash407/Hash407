#include<stdio.h>
#include <string.h>
#include<stdlib.h>
struct Node {
 char ssn[20], name[20], dept[20], desig[20];
 float sal;
 long int phno;
 struct Node *prev;
 struct Node *next;
};
typedef struct Node* NODE;
NODE createNode() {
 NODE newNode = (NODE)malloc(sizeof(struct Node));
 printf("Enter SSN, Name, Dept, Designation, Salary, PhNo: \n");
 scanf("%s %s %s %s %f %ld", newNode ->ssn, newNode ->name, newNode ->dept, newNode ->desig, &newNode ->sal, &newNode ->phno);
 newNode ->prev = NULL;
 newNode ->next = NULL;
 return newNode;
}
NODE insertEnd(NODE head) {
 NODE temp = createNode();
 if (head == NULL) return temp;
 NODE cur = head;
 while (cur ->next != NULL) cur = cur ->next;
 cur->next = temp;
 temp ->prev = cur;
 return head;
}
NODE insertFront(NODE head) {
 NODE temp = createNode();
 if (head == NULL) return temp;

 temp ->next = head;
 head ->prev = temp;
 return temp;
}
NODE deleteFront(NODE head) {
 if (head == NULL) {
 printf("List is empty. \n");
 return NULL;
 }
 NODE temp = head;
 head = head ->next;
 if (head != NULL) head ->prev = NULL;
 printf("Deleted SSN: %s \n", temp ->ssn);
 free(temp);
 return head;
}
NODE deleteEnd(NODE head) {
 if (head == NULL) {
 printf("List is empty. \n");
 return NULL;
 }
 NODE cur = head;
 if (cur ->next == NULL) {
 printf("Deleted SSN: %s \n", cur ->ssn);
 free(cur);
return NULL;
 }
 while (cur ->next != NULL) cur = cur ->next;
 cur->prev ->next = NULL;
 printf("Deleted SSN: %s \n", cur ->ssn);
 free(cur);
 return head;
}
void display(NODE head) {
 int count = 0;
 if (head == NULL) {
 printf("DLL is empty. Count = 0 \n");
 return;
 }
 printf(" \nSSN \tName \tDept \tDesignation \tSalary \tPhone \n");
 NODE cur = head;
 while (cur != NULL) {

 printf("%s \t%s\t%s\t%s\t%.2f \t%ld \n", cur ->ssn, cur ->name, cur ->dept, cur ->desig, cur ->sal, cur ->phno);
 cur = cur ->next;
 count++;
 }
 printf(" \nTotal Employees: %d \n", count);
}
int main() {
 NODE head = NULL;
 int choice, n, i;
 while (1) {
 printf(" \n--- DLL Employee Menu ---");
 printf(" \n1. Create DLL (N Employees) \n2. Display & Count \n3. Insert End \n4. Delete End");
 printf(" \n5. Insert Front \n6. Delete Front \n7. Double Ended Queue Demo \n8. Exit \nChoice:");
 scanf("%d", &choice);
 switch (choice) {
 case 1:
 printf("Enter number of employees: ");
 scanf("%d", &n);
 for (i = 0; i < n; i++) head = insertEnd(head);
 break;
 case 2: display(head); break;
 case 3: head = insertEnd(head); break;
 case 4: head = deleteEnd(head); break;
 case 5: head = insertFront(head); break;
 case 6: head = deleteFront(head); break;
 case 7:
 printf("DLL supports Insert/Delete at both ends, making it a Deque. \n");
 break;
 case 8: exit(0);
 default: printf("Invalid choice! \n");
 }
 }
 return 0;
}
