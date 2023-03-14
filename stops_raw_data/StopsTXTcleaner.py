import csv
sim = set()

with open('./stops_raw_data/stops.txt', 'r') as f:
    with open('./stops_raw_data/2023stops.csv', 'w') as output:
        writer = csv.writer(output)
        for line in f:
            new = []
            a = line.split(',')
            diferenca = len(a) - 13
            new.append(a[4 + diferenca])
            new.append(a[5 + diferenca])
            writer.writerow(new)
                
            
        print(sim)
            