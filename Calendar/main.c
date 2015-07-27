
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <errno.h>

 
int getDaysInMonth(int);
int calculateDayOfYear1();
int calculateDayOfYear2();
void calculateCalendarDate();
int calculateTotalDaysBetween();
 
void errorHandling();
void assignWeekday();
void assignMonth();
void assignDate();
void getTheDate();
void quit();
void setDate1();
void setDate2();
int getNumber();
void aString();
char sentence[ 80 ];
int date1[3];
int date2[3];
int aMonth;
char *theMonth;
char *month[12] = {  "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
int numberDay;

int main(int argc, char *argv[]) {
    char *weekday[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
    int menuChoice;

    printf("Please choose from the following options: \n"
            "To find what day of the year a date falls on, please press 1. \n"
            "To calculate what the date will be a certain number of days from any particular date, please press 2. \n"
            "To calculate the number of days in between two dates, please press 3. \n"
            "To exit this program, enter 4. \n");
    scanf("%d", &menuChoice);
    switch (menuChoice) {
        case 1:
            printf(" %d,", calculateDayOfYear1());
            
            break;
        case 2:
            calculateCalendarDate();
            printf(" %d,%d,%d,", date1[0], date1[1], date1[2]);
            break;
        case 3:
            printf("Please remember to enter the dates earliest to latest.\n");
            printf(" %d,", calculateTotalDaysBetween());
            break;
        case 4:
            printf("You chose option 4.\n");
            quit();
            break;
        default:
            printf("Please try again");
    }
    return 0;
}

// takes user input of date as strings and then separates the string into 3 tokens. Each token is converted to an integer value
// and then placed in a small int array, date1

void setDate1() {
    int i = 0;
    char theInputDate1[12];
    char delims[] = "/";
    char *result = NULL;
    printf("Please enter the date you would like to calculate in the format mm/dd/yyyy and then press enter\n");
    getchar();
    fgets(theInputDate1, 12, stdin);
    result = strtok(theInputDate1, delims);
    while (result != NULL) {
        date1[i] = atoi(result);
        result = strtok(NULL, delims);
        i++;
    }
}
// takes user input of date as strings and then separates the string into 3 tokens. Each token is converted to an integer value
// and then placed in a small int array, date2

void setDate2() {
    int i = 0;
    char theInputDate2[12];
    char delims[] = "/";
    char *result = NULL;
    printf("Please enter the second date and then press enter\n");
    getchar();
    fgets(theInputDate2, 12, stdin);
    result = strtok(theInputDate2, delims);
    while (result != NULL) {
        date2[i] = atoi(result);
        result = strtok(NULL, delims);
        i++;
    }

}

//gets user input

int getNumber() {
    int inputNumber;
    printf("How many days from that date would you like to calculate? \n");
    scanf("%d", &inputNumber);
    return inputNumber;
}

//returns value as string

void aString() {
    int month1 = date1[0];
    int day1 = date1[1];
    int year1 = date1[2];
    int month2 = date2[0];
    int day2 = date2[1];
    int year2 = date2[2];
    printf("%s  is %s, %s is %d, %s is %d \n", "month 1", month[month1 - 1], "day 1", day1, "year 1", year1);
    printf("%s  is %s, %s is %d, %s is %d \n", "month 2", month[month2 - 1], "day 2", day2, "year 2", year2);
}

//calls setDate() to get user input and then determines the numerical position of the date in the year.

int calculateDayOfYear1() {
    setDate1();
    int i = 0;
    int endMonth = date1[0];
    int endDay = date1[1];
    int days;
    for (i = 0; i < endMonth; i++) {
        days = getDaysInMonth(i) + days;
    }
    int totalDays = days + endDay;
    return totalDays;
}

//calls setDate() to get user input and then determines the numerical position of the date in the year.

int calculateDayOfYear2() {
    setDate2();
    int i = 0;
    int endMonth = date2[0];
    int endDay = date2[1];
    int days;
    for (i = 0; i < endMonth; i++) {
        days = getDaysInMonth(i) + days;
    }
    int totalDays = days + endDay;
    return totalDays;
}

//takes an integer representing a month as an argument, and returns the number of days in that month.

int getDaysInMonth(int aMonth) {
    int daysInMonth = 0;
 
    if (aMonth == 0) {
        theMonth = month[0];
        daysInMonth = 31;
    } else if (aMonth == 1) {
        theMonth = month[1];
        daysInMonth = 29;
    } else if (aMonth == 2) {
        theMonth = month[2];
        daysInMonth = 31;
    } else if (aMonth == 3) {
        theMonth = month[3];
        daysInMonth = 30;
    } else if (aMonth == 4) {
        theMonth = month[4];
        daysInMonth = 31;
    } else if (aMonth == 5) {
        theMonth = month[5];
        daysInMonth = 30;
    } else if (aMonth == 6) {
        theMonth = month[6];
        daysInMonth = 31;
    } else if (aMonth == 7) {
        theMonth = month[7];
        daysInMonth = 31;
    } else if (aMonth == 8) {
        theMonth = month[8];
        daysInMonth = 30;
    } else if (aMonth == 9) {
        theMonth = month[9];
        daysInMonth = 31;
    } else if (aMonth == 10) {
        theMonth = month[10];
        daysInMonth = 30;
    }
  else if (aMonth == 11) {
        theMonth = month[11];
        daysInMonth = 31;
    }

    return daysInMonth;
}


//takes an int representing a day of the year, and returns the month that the day falls on.

int findTheMonth(int day) {

    int m2;
    if (day <= 31) {
        m2 = 1;
    } else if (day <= 60) {
        m2 = 2;
    } else if (day <= 91) {
        m2 = 3;
    } else if (day <= 121) {
        m2 = 4;
    } else if (day <= 152) {
        m2 = 5;
    } else if (day <= 182) {
        m2 = 6;
    } else if (day <= 213) {
        m2 = 7;
    } else if (day <= 244) {
        m2 = 8;
    } else if (day <= 274) {
        m2 = 9;
    } else if (day <= 305) {
        m2 = 10;
    } else if (day <= 336) {
        m2 = 11;
    } else if (day <= 365) {
        m2 = 12;
    }
    return m2;
}


// calls calculateDaysofYear and getNumber to recieve user input on starting date, and the amount of days from the start
// to calculate. Finds what the date will be x amount of days from starting date

void calculateCalendarDate() {
    setDate1();
    int daysFrom = getNumber();
    int y = date1[2];
    int d = date1[1];
    int m = date1[0]; //gets start month
    int flag = 0;
    int counter = 0;
    int dm;


    while (counter <= daysFrom) {
        for (m = date1[0]; m <= 11; m++) {//while the current month is less than or equal to twelve
            dm = getDaysInMonth(m); // get the amount of days in this current month
            for (d = date1[1]; d <= dm; d++) { // while the current day is less than days in month
                date1[1] = d;
                date1[0] = m;
                date1[2] = y;
                counter++;
                if (counter > daysFrom) {   // if the amount of days we are calculating to is reached,
                    flag = 1;               //set the flag value to 1 and break
                    break;
                }
            }
            if (flag == 1) {        // upon exiting inner loop check if the exit is due to amount of days reached
                flag = 2;           // if so set flag value to 2
                break;
            }
            date1[1] = 1;
            d = 1;
        }
        if (flag == 2) { // upon exiting outer loop check if the exit is due to amount of days reached
            break;      // if so, break
        }
        y++;
        date1[0] = 0;
        m = 0; //set month back to 0, increment year
    }    
}
 


//calculates the total amount of days between 2 dates.

int calculateTotalDaysBetween() {
int counter =0;
    setDate1();
    setDate2();
    int y = date1[2];
    int d = date1[1];
    int m = date1[0];  
    int flag = 0;
    int dm;  
    
  do {
    for (m = date1[0]; m <= 11; m++) {//while the current month is less than or equal to twelve
        dm = getDaysInMonth(m); // get the amount of days in this current month
        for (d = date1[1]; d <= dm; d++) { // while the current day is less than days in month
            date1[1] = d;
            date1[0] = m;
            date1[2] = y;
            counter++;
            if ((date2[0] == m)&&(date2[1] == d)&&(date2[2] == y)) { // if the amount of days we are calculating to is reached,
                flag = 1; //set the flag value to 1 and break
                break;
            }
        }
        if (flag == 1) { // upon exiting inner loop check if the exit is due to amount of days reached
            flag = 2; // if so set flag value to 2
            break;
        }
        date1[1] = 1;
        d = 1;
    }
    if (flag == 2) { // upon exiting outer loop check if the exit is due to amount of days reached
        break; // if so, break
    }
    y++;
    date1[0] = 0;
    m = 0; //set month back to 0, increment year
   }  
   while (!(date1[0] == date2[0])&&!(date1[1] == date1[2])&&!(date1[2] == date2[2]));
    return counter;
}    

  

//calculates the distance  between two days


void errorHandling() {
}

void chooseRoutine() {
    printf("Please choose a routine from the following options: \n To calculate the day number in a year, press 1. \n To calculate what the date will be in a given amount of days, press 2. \n"
            "To calculate how many far apart 2 days are from each other, press 3.");
}

void tryAgain() {
    printf("Please type the integer associated with the following selections:  \n To calculate the day number in a year, press 1. \n To calculate what the date will be in a given amount of days, press 2. \n"
            "To calculate how many far apart 2 days are from each other, press 3.");
}

void quit() {
    printf("Do you really want to quit this program? Please press 'y' for yes, or 'n' to continue");

}
