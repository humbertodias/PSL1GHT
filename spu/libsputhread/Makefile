#---------------------------------------------------------------------------------
# Clear the implicit built in rules
#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

ifeq ($(strip $(PSL1GHT)),)
$(error "Please set PSL1GHT in your environment. export PSL1GHT=<path>")
endif

include	$(PSL1GHT)/spu_rules

BUILD		:=	build

#---------------------------------------------------------------------------------
ifeq ($(strip $(PLATFORM)),)
#---------------------------------------------------------------------------------
export BASEDIR		:= $(CURDIR)
export DEPS			:= $(BASEDIR)/deps
export LIBS			:= $(BASEDIR)/lib

#---------------------------------------------------------------------------------
else
#---------------------------------------------------------------------------------

export LIBDIR		:= $(LIBS)/$(PLATFORM)
export DEPSDIR		:= $(DEPS)/$(PLATFORM)

#---------------------------------------------------------------------------------
endif
#---------------------------------------------------------------------------------

LIBRARY		:= $(LIBDIR)/libsputhread

#---------------------------------------------------------------------------------
INCLUDES	:= -I$(BASEDIR) -I$(BASEDIR)/../include -I$(BASEDIR)/../include/sys

CFLAGS		:= -Os -fpic -ffast-math -ftree-vectorize -funroll-loops -fschedule-insns \
			   -Wall $(MACHDEP) -DLIBRT_INTERNAL $(INCLUDES)
ASFLAGS		:= $(MACHDEP) -D__ASSEMBLY__ $(INCLUDES)

#---------------------------------------------------------------------------------
VPATH :=	$(BASEDIR)

#---------------------------------------------------------------------------------
OBJS		:= \
			spu_thread_group_exit.o spu_thread_group_yield.o spu_thread_exit.o \
			spu_thread_send_event.o spu_thread_receive_event.o spu_thread_throw_event.o \
			spu_thread_tryreceive_event.o spu_call_event_va_arg.o

all: spu

#---------------------------------------------------------------------------------
spu:
#---------------------------------------------------------------------------------
	@[ -d $(LIBS)/spu ] || mkdir -p $(LIBS)/spu
	@[ -d $(DEPS)/spu ] || mkdir -p $(DEPS)/spu
	@[ -d spu ] || mkdir -p spu
	@$(MAKE) PLATFORM=spu lib -C spu -f $(CURDIR)/Makefile

#---------------------------------------------------------------------------------
install: all
#---------------------------------------------------------------------------------
	@[ -d $(PSL1GHT)/spu/lib ] || mkdir -p $(PSL1GHT)/spu/lib
	@cp -frv $(CURDIR)/lib/spu/*.a $(PSL1GHT)/spu/lib

#---------------------------------------------------------------------------------
$(LIBRARY).a: $(OBJS)
#---------------------------------------------------------------------------------

.PHONY: lib spu install

#---------------------------------------------------------------------------------
lib: $(LIBRARY).a
#---------------------------------------------------------------------------------

#---------------------------------------------------------------------------------
clean:
#---------------------------------------------------------------------------------
	@echo clean ...
	@rm -rf spu
	@rm -rf $(DEPS)
	@rm -rf $(LIBS)

-include $(DEPSDIR)/*.d
