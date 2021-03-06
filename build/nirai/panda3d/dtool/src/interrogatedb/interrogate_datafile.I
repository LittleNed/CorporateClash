// Filename: interrogate_datafile.I
// Created by:  drose (09Aug00)
//
////////////////////////////////////////////////////////////////////
//
// PANDA 3D SOFTWARE
// Copyright (c) Carnegie Mellon University.  All rights reserved.
//
// All use of this software is subject to the terms of the revised BSD
// license.  You should have received a copy of this license along
// with this source code in a file named "LICENSE."
//
////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////
//     Function: idf_output_vector
//  Description: Writes the indicated vector to the output file.  Each
//               component is written using its normal ostream output
//               operator.
////////////////////////////////////////////////////////////////////
template<class Element>
void
idf_output_vector(ostream &out, const vector<Element> &vec) {
  out << vec.size() << " ";
  TYPENAME vector<Element>::const_iterator vi;
  for (vi = vec.begin(); vi != vec.end(); ++vi) {
    out << (*vi) << " ";
  }
}


////////////////////////////////////////////////////////////////////
//     Function: idf_input_vector
//  Description: Reads the given vector from the input file, as
//               previously written by output_string().  Each
//               component is read using its normal istream input
//               operator.
////////////////////////////////////////////////////////////////////
template<class Element>
void
idf_input_vector(istream &in, vector<Element> &vec) {
  int length;
  in >> length;
  if (in.fail()) {
    return;
  }

  vec.clear();
  vec.reserve(length);
  while (length > 0) {
    Element elem;
    in >> elem;
    vec.push_back(elem);
    length--;
  }
}
