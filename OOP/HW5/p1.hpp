#include <bits/stdc++.h>
#include <iostream>
#include <string>
/*add the header if you need*/
using namespace std;

//Abstract base class for Dessert Item hierarchy
class DessertItem
{
private:
    //Name of the DessertItem object
    string name;

public:
    DessertItem(){}
    DessertItem(string name):name(name){}
    //Empty virtual destructor for DessertItem class
    virtual ~DessertItem(){}     
    //returns Name of DessertItem  
    string getName(){ return name;}
    virtual string getDetails() = 0;
    virtual double getCost() = 0;
};

class IceCream : public DessertItem 
{
public:
    /* Write about IceCream Constructor
       IceCream(string name, double cost):DessertItem(name),cost(cost)
    */
    IceCream() {}
    IceCream(string name, double cost):DessertItem(name), cost(cost) {}
    virtual ~IceCream() {}

    /* Write about IceCream other member functions*/
    virtual string getDetails() { return ""; }
    virtual double getCost() { return cost; }

private:
    double cost;
};

class Topping : public IceCream 
{
public:
    /* Write about Topping Constructor
       Topping(string iceCreamName, double iceCreamCost,
	string toppingName, double toppingCost)
    */
    Topping() {}
    Topping(string iceCreamName, double iceCreamCost, string toppingName, double toppingCost):IceCream(toppingName+" Sundae with "+iceCreamName,iceCreamCost),toppingName(toppingName),toppingCost(toppingCost) {}
    virtual ~Topping() {}

    /* Write about Topping other member functions*/
    virtual string getDetails() { return ""; }
    virtual double getCost() { return toppingCost + IceCream::getCost(); }

private:
    string toppingName;
    double toppingCost;
};

class Cookie : public DessertItem 
{
public:
    /* Write about Cookie Constructor
       Cookie(string name, int number, double pricePerDozen)
    */
    Cookie() {}
    Cookie(string name, int number, double pricePerDozen):DessertItem(name),number(number),pricePerDozen(pricePerDozen) {}
    virtual ~Cookie() {}

    /* Write about Cookie other member functions*/
    virtual string getDetails() {
        stringstream s;
        string strn, strp;
        s << number;
        s >> strn;
        s.clear();
        s << pricePerDozen;
        s >> strp;
        return "("+strn+" dozen(s) * "+strp+"/dozen)\n";
    }
    virtual double getCost() { return pricePerDozen*number; }

private:
//Number of dozens of Cookie
    int number;
    double pricePerDozen;
};

class Candy : public DessertItem 
{
public:
    /* Write here about Candy Constructor
       Candy(string name, double weight, double pricePerGram)
    */
    Candy() {}
    Candy(string name, double weight, double pricePerGram):DessertItem(name),weight(weight),pricePerGram(pricePerGram) {}
    virtual ~Candy() {}

    /* Write about Candy other member functions*/
    virtual string getDetails() {
        stringstream s;
        string strw, strp;
        s << weight;
        s >> strw;
        s.clear();
        s << pricePerGram;
        s >> strp;
        return "("+strw+" gram(s) * "+strp+"/gram)\n";
    }
    virtual double getCost() { return pricePerGram * weight; }

private:
//Weight of Candy
    double weight;
    double pricePerGram;
};



class Checkout {

public: 
    friend ostream &operator<<(std::ostream &, Checkout &);

    /* Write about Checkout member functions
    1. "enterItem" function to add the element into the list
    2. "removeItem" function to remove the elemtent from the list
    3. calculate the total cost and tax in the list
    4. "numberOfItems" for number of Item in the list
    5. "clear" clear all Items from list
    */
    template<typename T>
    void enterItem(T *di) {
        itemList.push_back(di);
        return;
    }
    template<typename T>
    void removeItem(T *di) {
        itemList.remove(di);
        return;
    }
    double totalCost() {
        double cost = 0;
        for(list<DessertItem*>::iterator it = itemList.begin(); it != itemList.end(); ++it)
            cost += (*it)->getCost();
        return cost;
    }
    double tax() {
        return totalCost() * 0.05;
    }
    int numberOfIteams() {
        return itemList.size();
    }
    void clear () {
        itemList.clear();
        return;
    }
private:
    list<DessertItem*> itemList;
};


ostream &operator<<(ostream &output, Checkout &checkout){
  
    /*Overloaded operator that output a receipt for the current list of items*/
    output << "Welcome to OOP’s shop\n------------------------------\n" << endl;
    output << "Number of items: " << checkout.numberOfIteams() << endl << endl;
    for(list<DessertItem*>::iterator it = checkout.itemList.begin(); it != checkout.itemList.end(); ++it)
        output << setw(40) << left << (*it)->getName() << setw(5) << right << round((*it)->getCost()) << endl << (*it)->getDetails();
    output << "\n------------------------------\n";
    output << setw(40) << left << "Cost" << setw(5) << right << round(checkout.totalCost()) << endl;
    output << setw(40) << left << "Tax" << setw(5) << right << round(checkout.tax()) << endl << endl;
    output << setw(40) << left << "Total cost" << setw(5) << right << round(checkout.totalCost()+checkout.tax()) << endl;
    output.clear();
    return output;
}
