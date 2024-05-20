import java.util.HashMap;

/**
 * ClosestSum
 */
public class ClosestSum {

    public static void main(String[] args) {

        int[] arr = { 0, 0, 0, 4 };
        printArray(arr);
        System.out.println("\n");
        if (arr.length >= 3) {
            findClosestSum(arr);
        } else {
            System.out.println("Array is too short, minimum three elements are required");
        }
    }

    static void findClosestSum(int[] arr) {
        Integer diff = null;
        int target = 0;
        System.out.println("Target value: " + target + "\n");
        HashMap<int[], Integer> sumValues = new HashMap<>();

        for (int i = 0; i < arr.length - 2; i++) {
            for (int j = i + 1; j < arr.length - 1; j++) {
                if (j != i) {

                    for (int k = j + 1; k < arr.length; k++) {
                        if (k != i && k != j) {
                            int sum = arr[i] + arr[j] + arr[k];
                            int remainingDiff = sum - target;
                            remainingDiff = Math.abs(remainingDiff);

                            if (remainingDiff != 0 && (diff == null || diff > remainingDiff)) {
                                diff = remainingDiff;
                                sumValues.clear();
                                sumValues.put(new int[] { arr[i], arr[j], arr[k] }, sum);

                            } else if (diff == remainingDiff) {
                                sumValues.put(new int[] { arr[i], arr[j], arr[k] }, sum);
                            }
                        }
                    }
                }
            }
        }
        if (sumValues.size() > 0) {
            sumValues.entrySet().stream()
                    .forEach(entry -> {
                        printArray(entry.getKey());
                        System.out.print(" has the closest value " + entry.getValue() + "\n");
                    });
        } else {
            System.out.println("No Closet sum found.");
        }

    }

    static void printArray(int[] arr) {
        System.out.print("[");
        for (int i = 0; i < arr.length; i++) {
            if (i != arr.length - 1) {
                System.out.print(arr[i] + ", ");
            } else {
                System.out.print(arr[i]);
            }
        }
        System.out.print("]");
    }
}

