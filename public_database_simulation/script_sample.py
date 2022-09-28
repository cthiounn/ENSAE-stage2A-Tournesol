import random
import sys


def main(argv):
    if len(argv)==2:
        filename,samplesize=argv
    elif len(argv)==1:
        filename=argv[0]
        samplesize=10000
    else:
        filename="sample.txt"
        samplesize=10000
        
    samples=[(random.randint(1,2234),*random.sample(range(1,9045),2),random.randint(-10,10)) for _ in range(int(samplesize))] 
    with open(filename, 'w') as f:
        for i,j,k,l in samples:
            print(i,j,k,l)
            f.write('{} {} {} {}\n'.format(i,str(j).zfill(11),str(k).zfill(11),l))
            
            
if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))  # next section explains the use of sys.exit