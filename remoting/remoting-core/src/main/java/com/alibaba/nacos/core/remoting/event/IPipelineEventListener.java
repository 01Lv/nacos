/*
 * Copyright (C) 2019 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.alibaba.nacos.core.remoting.event;

import com.alibaba.nacos.core.remoting.event.reactive.BaseEventPipelineReactive;
import com.alibaba.nacos.core.remoting.event.reactive.IEventPipelineReactive;

import java.util.EventListener;

/**
 * A listener with event pipeline features.
 * <p>
 * Multiple event listeners can be in the form of a pipeline to respond to an event.
 * An event can interrupt the response in one of the listeners in the middle if onEvent returns false
 *
 * @author pbting
 * @date 2019-08-22 5:10 PM
 */
public interface IPipelineEventListener<T extends Event> extends EventListener {

    /**
     * @param event         The event being responded to
     * @param listenerIndex The eventListener index of the current response event
     * @return
     */
    boolean onEvent(T event, int listenerIndex);

    /**
     * The type of event currently interested in this event listener.
     * <p>
     * Can have multiple
     *
     * @return
     */
    int[] interestEventTypes();

    /**
     * event pipeline reactive partition.
     * Multiple eventListeners can be merged into the specified partition according to their respective characteristics
     * By default, all of the event listeners are under the BaseEventPipelineReactive partition.
     *
     * @return the default event listener partition。
     */
    default Class<? extends IEventPipelineReactive> pipelineReactivePartition() {

        return BaseEventPipelineReactive.class;
    }

}
