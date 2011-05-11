/* generated by rpcoder */

package foo.bar
{
    import mx.rpc.events.FaultEvent;

    public class APIDummy implements APIInterface
    {
        private var _errors:Array = new Array();
        private var _dummy_success:Array = new Array();

        public function setDummySuccess(function_name:String, success:Array):void
        {
            _dummy_success[function_name] = success;
        }

        private function getDummySuccess(function_name:String):Array
        {
            return _dummy_success[function_name];
        }

        public function setError(function_name:String, is_error:Boolean):void
        {
            _errors[function_name] = is_error;
        }

        private function isError(function_name:String):Boolean
        {
            return _errors[function_name];
        }

        /**
        * get mail
        *
        * @id:int  
        * @foo:String ["A", "B"] 
        * @bar:Array  
        * @baz:Boolean  日本の文字
        * @success:Function
        * @error:Function
        */
        public function getMail(id:int, foo:String, bar:Array, baz:Boolean, success:Function, error:Function):void
        {
            requestDummy('getMail', success, error);
        }

        /**
        * get mails
        *
        * @success:Function
        * @error:Function
        */
        public function getMails(success:Function, error:Function):void
        {
            requestDummy('getMails', success, error);
        }

        public function requestDummy(function_name:String, success:Function, error:Function):void
        {
            if ( isError(function_name) )
            {
                error(new FaultEvent("dummy fault"));
            }
            else
            {
                success.apply(this, getDummySuccess(function_name));
            }
        }
    }
}
