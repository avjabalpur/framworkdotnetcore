using System;
using System.Collections.Generic;
using System.Text;
using avFramworktalents.data;
using avFramworktalents.models;

namespace avFramworktalents.services.Payment
{
    public class PaymentService : IPaymentService
    {
        private avFramworkDbContext dbContext { get; }
        public PaymentService(avFramworkDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public bool DoPaymentByUserId(RequestPayment payment)
        {
            throw new NotImplementedException();
        }
    }
}
