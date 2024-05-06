def find_contiguous_subarray(given_array, target_sum):
    current_pointer = 0 
    end_pointer = len(given_array)
    for i in range(current_pointer, end_pointer):
        if given_array[i] == target_sum:
            return given_array[i]
        elif given_array[i] > target_sum:
            current_pointer += 1
            continue
        else:
            rotating_index = i + 1
            sub_array = [given_array[i]]
            sub_array_sum = sum(sub_array)
                
            while(sub_array_sum < target_sum):
                rotating_element = given_array[rotating_index]
                sub_array.append(rotating_element)
                sub_array_sum = sum(sub_array)
                if sub_array_sum == target_sum:
                    return sub_array
                rotating_index += 1
                if rotating_index > end_pointer:
                    break

given_array = [3, 27, 56, 89, 12, 5, 74, 8, 43]
print(find_contiguous_subarray(given_array, 79))
