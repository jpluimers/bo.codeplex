﻿using System;
using System.Collections.Generic;

namespace bo.Extensions.Generic.ICollectionExtensions
{
    public static class ICollectionExtensions
    {
        public static void AddRange<T, S>(this ICollection<T> list, params S[] values)
            where S : T
        {
            foreach (S value in values)
                list.Add(value);
        }
    }
}
