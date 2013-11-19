#include <string>
#include <iostream>
#include <fstream>
#include <stdint.h>
using namespace std;

#include "person.pb.h"

// Write a toy protobuf to a file.
int main(int argc, char **argv) 
{
	Person person;
	person.set_id(123);
	person.set_name("Bob");
	person.set_email("bob@example.com");

	fstream out("person.pb", ios::out | ios::binary | ios::trunc);
	person.SerializeToOstream(&out);
	out.close();
}
