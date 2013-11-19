#include <string>
#include <iostream>
#include <fstream>
#include <stdint.h>
using namespace std;

#include "person.pb.h"

// Read a toy protobuf from a file.
int main(int argc, char **argv) 
{
	Person person;
	fstream in("person.pb", ios::in | ios::binary);
	if (!person.ParseFromIstream(&in)) {
		cerr << "Failed to parse person.pb." << endl;
		exit(1);
	}

	cout << "ID: " << person.id() << endl;
	cout << "name: " << person.name() << endl;
	if (person.has_email()) {
		cout << "e-mail: " << person.email() << endl;
	}
}
