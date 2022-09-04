int vet[5] = {10, 20, 10, 40, 20};

int process(int * n) {
    return *n = 0;
}

void calc(int *resp, int mark) {
    int i = 0;

    while (i < 5) {
        if (vet[i] == mark)
            *resp = process(&vet[i]);
        else
            mark = *resp;
        
        i++;
    }   
}