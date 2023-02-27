inline U0 Swap(I32 *a, int *b) {
    asm(
        "mov eax, [ebp + 8]\n\t"
        "mov ebx, [ebp + 12]\n\t"
        "mov ecx, [eax]\n\t"
        "xchg ecx, [ebx]\n\t"
        "mov [eax], ecx\n\t"
        "mov [ebx], ecx\n\t"
    );
}

inline I32 Partition(int arr[], int low, int high) {
    I32 pivot = arr[high];
    I32 i = low - 1;

    for (I32 j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            Swap(&arr[i], &arr[j]);
        }
    }

    Swap(&arr[i + 1], &arr[high]);
    return i + 1;
}

void Quicksort(I32 arr[], int low, int high) {
    if (low < high) {
        I32 pi = Partition(arr, low, high);
        Quicksort(arr, low, pi - 1);
        Quicksort(arr, pi + 1, high);
    }
}

I32 main() {
    I32 arr[] = { 10, 7, 8, 9, 1, 5 };
    I32 n = sizeof(arr) / sizeof(arr[0]);

    Quicksort(arr, 0, n - 1);

    return 0;
}
