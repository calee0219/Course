const int size=10;

void sort(int arr[]){
	//add here
	int odd[size];
	int even[size];
	int oo = 0, eo = 0;
	for(int i = 0; i < size; ++i)
    {
        if(arr[i] & 1) odd[oo] = arr[i], ++oo;
        else even[eo] = arr[i], ++eo;
    }
    for(int i = 0; i < oo; ++i)
    {
        for(int j = 0; j < oo-1; ++j)
        {
            if(odd[j] < odd[j+1])
            {
                int tmp = odd[j];
                odd[j] = odd[j+1];
                odd[j+1] = tmp;
            }
        }
    }
    for(int i = 0; i < eo; ++i)
    {
        for(int j = 0; j < eo-1; ++j)
        {
            if(odd[j] < even[j+1])
            {
                int tmp = even[j];
                even[j] = even[j+1];
                even[j+1] = tmp;
            }
        }
    }
    int ord = 0;
    for(int i = 0; i < eo; ++i)
        arr[ord] = even[i], ord++;
    for(int i = 0; i < oo; ++i)
        arr[ord] = odd[i], ord++;
    return;
}
