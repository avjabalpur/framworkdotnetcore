using System;
using System.Collections.Generic;
using System.Text;
using avFramworktalents.models;

namespace avFramworktalents.services.Payment
{
   public interface IPaymentService
    {
        bool DoPaymentByUserId(RequestPayment payment);
    }
}
