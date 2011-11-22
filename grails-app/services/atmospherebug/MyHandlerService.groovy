package atmospherebug

class MyHandlerService {    

	static atmosphere = [mapping: '/atmosphere/test']
	
    def onRequest = { event ->	
		event.response.setContentType('text/plain;charset=UTF-8')
		event.suspend()
    }
	
	def onStateChange = { event ->
		if (!event.message) return
		if (event.isCancelled()) return
		event.resource.response.writer.with {
			write event.message.toString()
			flush()
		}
	}
}
