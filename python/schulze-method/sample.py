
from pyvotecore.schulze_method import SchulzeMethod

# A. Yu Rong
# C. Tao Long
# D. Anant Gupta
# E. Zhiyi
# F. Renato

ballots = [
    { "count":1, "ballot":[["E"], ["F"], ["D"], ["A"],["C"]] }, # Mark 
    { "count":1, "ballot":[["A"], ["C"], ["D"], ["E"],["F"]] }, # Swetha 
    { "count":1, "ballot":[["E"], ["A"], ["F"], ["D"],["C"]] }, # Ravi
    { "count":1, "ballot":[["E"], ["A"], ["D"], ["F"],["C"]] }, # Eric
    { "count":1, "ballot":[["A"], ["C"], ["D"], ["F"],["E"]] }, # Prasad


]

output=SchulzeMethod(ballots, ballot_notation=SchulzeMethod.BALLOT_NOTATION_GROUPING).as_dict()

print output['winner']

